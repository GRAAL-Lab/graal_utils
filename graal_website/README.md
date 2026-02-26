# GRAAL Website

[https://graal.dibris.unige.it](https://graal.dibris.unige.it)

CMS is Joomla 5.

This is a set of info on the different modules used on the pages.

## Page building and Template

The site Style used is [**Helix Ultimate**](https://www.joomla.it/blog/8956-helix-ultimate-framework.html).

Most of the pages are built with [**SP Page Builder**](https://extensions.joomla.org/extension/sp-page-builder/), which you can find in:  `Components->SP Page Builder->Pages`.

By now the only page not built like this, but as a Joomla Article, is the "Phd Theses" page, due to how the Bibtex plugin works (the {bibtex} hook is catched only on Articles).

## Projects

Module: [**TZ Portfolio**](https://extensions.joomla.org/extension/tz-portfolio/).

## About Us

Module: [**Trombinoscope contacts**](https://extensions.joomla.org/extension/trombinoscope-contacts/).

To add/remove people in About Us page the following actions are needed:

- In the Joomla Dashboard add a Contact in: `Components->Contacts->Contacts` (using the +New Button).
- Add Bio and Photo.
- In the **Category**  select the fitting one (`graal_team`/`graal_collab`/`graal_former`).

The page is built dynamically using a Joomla Module (which is inserted in the About Us "SP Page Builder" page).

## PhD Theses

[**Bibtex formatter**](https://extensions.joomla.org/extension/bibtex-formatter/).
