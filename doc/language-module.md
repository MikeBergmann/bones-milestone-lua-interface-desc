# Bones Milestone specific LUA modules

## Language

Bones delivers the Milestone devices in multiple languages. Therefore your programs should optimally support multilingualism. To keep the effort as low as possible, there is the module'' Language''. The functions of this module allow you to manage tables with character strings in different languages. Access is via [ISO 639-1 language abbreviation](https//en.wikipedia.org/wiki/List_of_ISO_639-1_codes) or via the index within the table. The following table represents the order of the languages within a translation table: 

```lua
local ltable = {
  {"English", "EN"},
  {"German", "DE"},
  {"French", "FR"},
  {"Italian", "IT"},
  {"Spanish", "ES"},
  {"Swedish", "SV"},
  {"Dutch", "NL"},
  {"Norwegian", "NO"},
  {"Danish", "DA"},
  {"Polish", "PL"},
  {"Icelandic", "IS"},
  {"Japanese", "JA"},
  {"Portugese", "PT"},
  {"Turkish", "TR"},
  {"Arabic", "AR"},
  {"Catalan", "CA"},
  {"Czech", "CZ"},
  {"Finnish", "FI"},
  {"N/A", "NA"},
  {"Greek", "EL"},
  {"Russia", "RU"},
  {"Portugese Brazil", "PT-BR"},
  {"Chinese", "CH"},
}
```

Functions:

*  machid
*  id
*  set
*  get
*  getlocal
