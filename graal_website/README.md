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

At the end of this file are the CSS modifications added in the Custom CSS of the Helix, edited via `System->Site Template Styles->shaper_helixultimate - Default" and then clicking on **Template Options**.

## Page: Projects

Module: [**TZ Portfolio**](https://extensions.joomla.org/extension/tz-portfolio/).

The portolio can be accessed in: `Components->TZ Portfolio Plus`.


There are two modules in `Content->Site Modules`:
  - Current Projects Portfolio
  - Past Projects Portfolio

They just differ from the selected Category in the module.

To add/move/delete a project go to `Components->TZ Portfolio Plus->Articles` and create a new one, selecting the "Main Category" as needed. If you have an image select as "Media Type" the option "Image", and upload one in the Image tab below. 

### Correct Menu Routing

When clicking on an a project, by default the website takes you to a TZ Portfolio article, and the top Main Menu loses the association with the Projects pages and by default highlights Home.

To correct this behaviour you need to create a Menu Item in `Menus->Main Menu` for the project, selecting "TZ Portfolio Plus->Single Article" in the "Menu Item Type", and then choosing the correct article.

(a CSS hack has been done to hide an infinite drop-down menu in the Main Menu, with all the projects).

## Page: About Us

Module: [**Trombinoscope contacts**](https://extensions.joomla.org/extension/trombinoscope-contacts/).

To add/remove people in About Us page the following actions are needed:

- In the Joomla Dashboard add a Contact in: `Components->Contacts->Contacts` (using the +New Button).
- Add Bio and Photo.
- In the **Category**  select the fitting one (`graal_team`/`graal_collab`/`graal_former`).

The page is built dynamically using a Joomla Module (which is inserted in the About Us "SP Page Builder" page).

## Page: PhD Theses

Plugin: [**Bibtex formatter**](https://extensions.joomla.org/extension/bibtex-formatter/).

This plugin works using a bibtex file. The folder where the .bib files are be placed can be changed, and by now is set to: `bibtex/phd_theses` (in the root folder).

To add a new entry simply update the bibtex file: `bibtex/phd_theses/phd_theses.bib`.

To add also a PDF file you need first to add with the Media Manager to the files, in: `Content->Media`, and the select "`Local/files/phd_theses`" in the file manager. Then you can add the **pdf** field in the bib entry.

## CSS Hacks in the Template

