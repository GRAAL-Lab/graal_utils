# GRAAL Website

[https://graal.dibris.unige.it](https://graal.dibris.unige.it)

CMS is Joomla 5.

This is a set of info on the different modules used on the pages.

To access the website via FTP for file upload you should first connect to the DIBRIS VPN (GlobalProtect), ask <assistenza@dibris.unige.it>.

The credentials are:
```
IP: 130.251.1.26
user: graaladmin
pwd: R1c3rc4D3lGr44l
```


## Page building and Template

The site Style used is [**Helix Ultimate**](https://www.joomla.it/blog/8956-helix-ultimate-framework.html).

Most of the pages are built with [**SP Page Builder**](https://extensions.joomla.org/extension/sp-page-builder/), which you can find in:  `Components->SP Page Builder->Pages`.

By now the only page not built like this, but as a Joomla Article, is the "Phd Theses" page, due to how the Bibtex plugin works (the {bibtex} hook is catched only on Articles).

## Projects

Module: [**TZ Portfolio**](https://extensions.joomla.org/extension/tz-portfolio/).

The portolio can be accessed in: `Components->TZ Portfolio Plus`.


There are two modules in `Content->Site Modules`:
  - Current Projects Portfolio
  - Past Projects Portfolio

They just differ from the selected Category in the module.

To add/move/delete a project go to `Components->TZ Portfolio Plus->Articles` and create a new one, selecting the "Main Category" as needed. If you have an image select as "Media Type" the option "Image", and upload one in the Image tab below. 

## About Us

Module: [**Trombinoscope contacts**](https://extensions.joomla.org/extension/trombinoscope-contacts/).

To add/remove people in About Us page the following actions are needed:

- In the Joomla Dashboard add a Contact in: `Components->Contacts->Contacts` (using the +New Button).
- Add Bio and Photo.
- In the **Category**  select the fitting one (`graal_team`/`graal_collab`/`graal_former`).

The page is built dynamically using a Joomla Module (which is inserted in the About Us "SP Page Builder" page).

## PhD Theses

Plugin: [**Bibtex formatter**](https://extensions.joomla.org/extension/bibtex-formatter/).

This plugin works using a bibtex file. The folder where the .bib files are be placed can be changed, and by now is set to: `bibtex/phd_theses` (in the root folder).

To add a new entry simply update the bibtex file: `bibtex/phd_theses/phd_theses.bib`.

To add also a PDF file you need first to add with the Media Manager to the files, in: `Content->Media`, and the select "`Local/files/phd_theses`" in the file manager. Then you can add the **pdf** field in the bib entry.