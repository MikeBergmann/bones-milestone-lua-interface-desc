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
*  [set](#set)
*  [get](#get)
*  [getlocal](#getlocal)

### machid
<a name="machid"></a>

    machid()

`machid` returns the language identification number of the corresponding system. This identification number corresponds to the index of the respective language in the following [Table](#Language).

###  id
<a name="id"></a>

    id(ISOlang)

`id` returns the language identification number for an [ISO 639-1 language abbreviation](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes). See also the following [Table](#Language).


###  set
<a name="set"></a>

    set(ISOlang, text, texttable)

`set` sets the specified text as language in the translation table `texttable`, which was specified by the `ISOlang` abbreviation. Return value is the new table.

Example::

```lua
local second
second = language.set("EN","seconds")
second = language.set("DE","Sekunden", introhigh)
```

Alternatively, the texts can also be transferred when the table is created:

```lua
local second = {"seconds", "Sekunden"}
```

Please note the following [Table](#Language) regarding the order.

`set` roughly corresponds to the following call:

```lua
texttable[id(ISOlang)] = text
```

###  get
<a name="get"></a>

    get(ISOlang, texttable)

`get` returns the text of the translation table `texttable` specified by the `ISOlang` abbreviation.

Example::

```lua
local second = {"seconds", "Sekunden"}
print('50' .. language.get("DE", second))
```

`get` roughly corresponds to the following call:

```lua
texttable[id(ISOlang)]
```

###  getlocal
<a name="getlocal"></a>

    getlocal(texttable)

`getlocal` returns the text from `texttable` in the language of the current system.

```lua
local second = {"seconds", "Sekunden"}
print('50 .. language.getlocal(second))
```

to make the usage even shorter you can set a corresponding abbreviation (e.g. `_T`):

```lua
local _T = language.getlocal -- to get local text  
local second = {"seconds", "Sekunden"}
print('50 .. _T(second))
```


