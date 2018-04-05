# Welcome!

It looks like you have found my personal portage overlay.
This overlay contains mostly random ebuilds that might be useful for somebody.

# Adding the overlay
The overlay is available using layman. Just run "layman -a jm-overlay" and you should be able to use it.
If you don't want to use layman, just clone the git repository somewhere and add the path to "PORTDIR_OVERLAY" in your make.conf

# Updating md5-cache
The directory metadata/md5-cache can contain cache files to speed up portage when working with ebuilds from the overlay.
This overlay does not include these files (anymore), so it is recommended to generate these yourself. To do that, just run:
```
egencache --update --repo=jm-overlay
```

# Quality of this overlay
Everything in this overlay should be considered experimental!
While I try to keep the quality of the ebuilds as high as I can, Gentoo can run in many different configurations and I can't test all of them myself. If you have any problems or suggestions, feel free to report them on github.

