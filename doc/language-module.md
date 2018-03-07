# Bones Milestone specific LUA modules

## Language
<a name="Language"></a>

Bones delivers the Milestone devices in multiple languages. Therefore your programs should optimally support multilingualism. To keep the effort as low as possible, there is the module'' Language''. The functions of this module allow you to manage tables with character strings in different languages. Access is via [ISO 639-1 language abbreviation](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) or via the index within the table. The following table represents the order of the languages within a translation table: 

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

*  [machid](#machid)
*  [id](#id)
*  set
*  get
*  getlocal

### machid
<a name="machid"></a>

    machid()

`machid` returns the language identification number of the corresponding system. This identification number corresponds to the index of the respective language in the following [Table](#Language).

###  id
<a name="id"></a>

    id(ISOlang)

`id` returns the language identification number for an [ISO 639-1 language abbreviation](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes). See also the following [Table](#Language).

