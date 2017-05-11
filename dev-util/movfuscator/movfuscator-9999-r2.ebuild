# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3 flag-o-matic

DESCRIPTION="The single instruction C compiler"
HOMEPAGE="https://github.com/xoreaxeaxeax/movfuscator"

LICENSE="MoVfuscator LCC test? ( Unlicense ) examples? ( BSD )"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="+softfloat postproc test doc examples libressl"

MOVFUSCATOR_REPO_URI="https://github.com/xoreaxeaxeax/movfuscator.git"
LCC_REPO_URI="https://github.com/drh/lcc"
TEST_REPO_URI="https://github.com/kokke/tiny-AES128-C"

# MoVfuscator needs a symlink the GCC's library path, so we need to force a rebuild
# after a GCC upgrade to update the symlink
DEPEND="amd64? ( sys-devel/gcc:=[multilib] )
	x86? ( sys-devel/gcc:= )
	examples? (
		amd64? (
			!libressl? ( dev-libs/openssl:0=[abi_x86_32] )
			libressl? ( dev-libs/libressl:0=[abi_x86_32] )
			sys-libs/ncurses:0=[abi_x86_32]
		)
		x86? (
			!libressl? ( dev-libs/openssl:0= )
			libressl? ( dev-libs/libressl:0= )
			sys-libs/ncurses:0=
		)
	)"
RDEPEND="${DEPEND}
	postproc? ( dev-lang/python:* )"
REQUIRED_USE="examples? ( softfloat )"

src_unpack() {
	git-r3_fetch "${MOVFUSCATOR_REPO_URI}"
	git-r3_fetch "${LCC_REPO_URI}"
	use test && git-r3_fetch "${TEST_REPO_URI}"
	git-r3_checkout "${MOVFUSCATOR_REPO_URI}" "${S}"
	git-r3_checkout "${LCC_REPO_URI}" "${S}/lcc"
	use test && git-r3_checkout "${TEST_REPO_URI}" "${S}/validation/aes"
}

src_prepare() {
	eapply_user
	if ! use softfloat; then
		head -n -7 build.sh > build2.sh || die
		mv build2.sh build.sh || die
	fi
	sed -i -e "s/-g/\$\{USER_CFLAGS\}/g" \
		-e "s/lcc all/lcc all CFLAGS=\"\$\{USER_CFLAGS\}\"/g" \
		build.sh || die
	sed -i -e "s|/usr/bin/cpp|$(which cpp)|g" \
		-e "s|/usr/bin/ld|$(which ld)|g" \
		movfuscator/host.c || die # These hardcodec paths may be wrong on gentoo
}

src_compile() {
	# LCC is pretty fragile when it comes to custom CFLAGS and likes to segfault a lot
	# Keep a few ones that should be safe
	export USER_CFLAGS=""
	for flag in pipe g ggdb ggdb{1,2,3,4,5,6,7,8,9} g{1,2,3,4,5,6,7,8,9} O{0,1,2,3,s}; do
		is-flagq "-${flag}" && export USER_CFLAGS="${USER_CFLAGS} -${flag}"
	done

	./build.sh || die

	if use doc; then
		cd overview || die
		rm prime_gcc* prime_mov* || die
		# Rebuild examples using commands from README.md
		gcc -S prime.c -o prime_gcc.asm || die
		gcc -c prime.c -o prime_gcc.o || die
		gcc ../validation/prime.c -o prime_gcc || die
		../build/movcc -S prime.c -o prime_mov.asm || die
		../build/movcc -c prime.c -o prime_mov.o || die
		../build/movcc ../validation/prime.c -o prime_mov || die
		cd .. || die
	fi

	if use examples; then
		cd validation || die
		for i in *.c; do # The included Makefile doesn't do anything
			../build/movcc -o ${i/.c} $i ../movfuscator/lib/softfloatfull.o -lncurses -lcrypto || die
		done
		cd .. || die
	fi

	# movcc relies on hardcoded paths, so we need to build a second version that we can install
	export BUILDDIR="${S}/build_new"
	mkdir build_new || die
	cp -r build/gcc build/include build_new/ || die
	emake -C lcc HOSTFILE=../movfuscator/host.c CFLAGS='${USER_CFLAGS} -DLCCDIR=\"${EROOT}usr/movfuscator/\"' lcc
	emake -C lcc all CFLAGS="${USER_CFLAGS}"
	ln -s lcc build_new/movcc || die
}

src_install() {
	insinto /usr/movfuscator
	exeinto /usr/movfuscator
	cd build_new || die
	doexe bprint cpp lburg lcc rcc movcc
	cd ../build || die
	doins -r crt*.o include gcc
	dosym "${EROOT}usr/movfuscator/movcc" /usr/bin/movcc

	cd .. || die
	use softfloat && doins -r movfuscator/lib
	mv post/README.md ./README_POST.md || die
	use postproc && doins -r post

	dodoc README.md
	use postproc && dodoc README_POST.md
	use doc && dodoc -r overview
	use doc && dodoc slides/*

	if use examples; then
		cd validation || die
		docinto examples
		exeinto /usr/share/doc/${PF}/examples
		rm gen_alu_test* || die # Not an example program
		for i in *.c; do
			doexe ${i/.c}
			dodoc $i
			[ -e ${i/.c}.h ] && dodoc ${i/.c}.h
		done
	fi
}

src_test() {
	./build/movcc validation/aes/aes.c validation/aes/test.c -o validation/aes/aes -s || die
	./validation/aes/aes | tee testout # Return code does not depend on test result, we need to parse the output
	if [ "$(grep FAILURE testout)" ]; then
		die "Tests failed"
	fi
}

pkg_postinst() {
	use softfloat && elog "Softfloat libraries have been installed into ${EROOT}usr/movfuscator/lib"
	use postproc && elog "Post-processors have been installed into ${EROOT}usr/movfuscator/post"
}
