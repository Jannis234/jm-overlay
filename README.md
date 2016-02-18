#Welcome!

It looks like you have found my personal portage overlay.
This overlay contains mostly random ebuilds that might be useful for somebody.

#Adding the overlay
The overlay is available using layman. Just run "layman -a jm-overlay" and you should be able to use it.

#Updating md5-cache
The directory metadata/md5-cache can contain cache files to speed up portage when working with ebuilds from the overlay.
This overlay does not include these files (anymore), so it is recommended to generate these yourself. To do that, just run:
```
egencache --update --repo=jm-overlay
```

