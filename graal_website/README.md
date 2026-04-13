# GRAAL Website

[https://graal.dibris.unige.it](https://graal.dibris.unige.it)

CMS is Joomla 5.

This is a set of info on the different modules used on the pages.

To access the website via FTP for file upload you should first connect to the DIBRIS VPN (GlobalProtect), ask <assistenza@dibris.unige.it>.

The credentials are:
```
IP: 130.251.1.26
user: graaladmin
pwd: (ask assistenza@dibris.unige.it)
```

## Page building and Template

The site Style used is [**Helix Ultimate**](https://www.joomla.it/blog/8956-helix-ultimate-framework.html).

All of the pages are built with [**SP Page Builder**](https://extensions.joomla.org/extension/sp-page-builder/), which you can find in:  `Components->SP Page Builder->Pages`.

At the end of this file are the CSS modifications added in the Custom CSS of the Helix style.


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

These additions are edited via `System->Site Template Styles->shaper_helixultimate - Default` and then clicking on **Template Options**.

Within the options, in the `</> Custom Code` tab:

- Before head:

```
<!-- Start cookieyes banner --> <script id="cookieyes" type="text/javascript" src="https://cdn-cookieyes.com/client_data/a6f51ac9c006be17b7cc931b/script.js"></script> <!-- End cookieyes banner -->
```

-  Custom CSS 

```
.article-details {
    margin:    0 auto;
    max-width: 1200px;
}

.sp-megamenu-parent > li > a {
    text-transform: uppercase;
}

/* =========================
   DESKTOP – hide all dropdown menus
   ========================= */
.sp-megamenu-parent .sp-dropdown {
    display: none !important;
}

/* Remove dropdown arrow indicators (optional) */
.sp-megamenu-parent .sp-has-child > a::after {
    display: none !important;
}

/* =========================
   MOBILE – hide all submenus
   ========================= */
.mod-menu .mod-menu__sub {
    display: none !important;
}

/* Hide mobile toggler arrows */
.mod-menu .menu-toggler {
    display: none !important;
}


#sp-main-body {
  padding: 50px 0;
}


/* Add some vertical margin for PageBuilder images when in column */
@media only screen and (max-width: 1300px) {

.sppb-addon-single-image-container {
   margin-bottom: 50px !important;
}

.contact .col-lg-auto {
    display: none;
}
}

/* Customise Trombinoscope Contact Position Color */
.person_position {
color: #003366;
}

.tp-item-tools {
    display: none
}

/* Make YouTube Embedding responsive */
.rwd-video {
    height: 0;
    overflow: hidden;
    padding-bottom: 56.25%;
    padding-top: 30px;
    position: relative;
}
.rwd-video iframe,
.rwd-video object,
.rwd-video embed {
    height: 100%;
    left: 0;
    position: absolute;
    top: 0;
    width: 100%;
    margin: 10px;
}

/* Customize TZ Portfolio Article */
.tpItemPage .tpArticleMedia img {
  width: 75%;
    display: block;
  margin-left: auto;
  margin-right: auto;
}

.contact-name {
   font-size: 90%;
}

.com-contact.contact {
  padding: 0px 1.5em 0px 1.5em;
}

.tpp-bootstrap .btn-primary {
  color: #fff;
  background-color: var(--template-link-color);
  border-color: var(--template-link-color);
}

.tpp-author-about {
  display: none !important;
}
```

R1c3rc4D3lGr44l

