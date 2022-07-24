local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local dn = ls.dynamic_node
local sn = ls.snippet_node
local i = ls.insert_node

function FilenameToPascalCase(filename)
  filename = string.gsub(filename, '.dart', '')
  filename = CamelCase(filename)
  return PascalCase(filename)
end

function PascalCase(str)
  return (str:gsub("^%l", string.upper))
end

function CamelCase(str)
  return string.gsub(str, "_%a+", function(word)
    local first = string.sub(word, 2, 2)
    local rest = string.sub(word, 3)
    return string.upper(first) .. rest
  end)
end

local statefulWidget = s(
  "stf", {
  t({ "import 'package:flutter/material.dart';", '', '' }),
  dn(1, function()
    classePrincipal = FilenameToPascalCase(vim.fn.expand("%:t"))

    return sn(nil, { t({ "class " .. classePrincipal .. " extends StatefulWidget {", '', '' }),
      t({ '  const ' .. classePrincipal .. '({ Key? key }) : super(key: key);', '', '' }),
      t({ '  @override', '  State<' .. classePrincipal .. '> createState() => _' .. classePrincipal .. 'State();', '}',
        '' }),
      t({ 'class _' .. classePrincipal .. 'State extends State<' .. classePrincipal .. '> {', '', "  @override", "" }),
      t({ '  Widget build(BuildContext context) {', '      return Scaffold(',
        "      appBar: AppBar(title: const Text('" }),
      i(1, "title"),
      t({ "'),),", "           body: Container(),", "       );", "  }", "}" }),

    })
  end, { 1 }),
}
)

local statelessWidget = s(
  "stl", {
  t({ "import 'package:flutter/material.dart';", '', '' }),
  dn(1, function()
    classePrincipal = FilenameToPascalCase(vim.fn.expand("%:t"))

    return sn(nil, { t({ "class " .. classePrincipal .. " extends StatelessWidget {", '', '' }),
      t({ '  const ' .. classePrincipal .. '({ Key? key }) : super(key: key);', '', '' }),
      t({ '  @override', '  Widget build(BuildContext context) {', "       return Container(", "           child: " }),
      i(1, "child"),
      t({ ',', "       );", "  }", "}" })
    })
  end, { 1 }),
}
)

local formKey = s('form-key', t('final formKey = GlobalKey<FormState>();'))

local abstractClass = s('abs-class', {
  dn(1, function()
    classePrincipal = FilenameToPascalCase(vim.fn.expand("%:t"))

    return sn(nil, {
      t({ "abstract class " .. classePrincipal .. " {", '  ' }),
      i(1, ''),
      t({ '', '}' })
    })
  end, { 1 })
})

local implementationClass = s('impl-class', {
  dn(1, function()

    classePrincipal = FilenameToPascalCase(vim.fn.expand("%:t"))

    return sn(nil, {
      t({ "class " .. classePrincipal .. " implements " .. string.gsub(classePrincipal, "Impl", "") .. " {", '  ' }),
      i(1, ''),
      t({ '', '}' })
    })
  end, { 1 })
})

local delay = s('delay', { t('await Future.delayed(const Duration(milliseconds: '), i(1, "milliseconds"), t('));') })

local modularBind = s('mbind', {t('Bind((i) => '),i(1,'object'),t('),')})

local modularRoute = s('mroute', {t("ChildRoute('"), i(0,'/'),t("',(_, _args) => "),i(1, 'page'),t(")")})

local modularModuleRoute = s('mmroute', {t("ChildRoute('"), i(0,'/'),t("', "),i(1, 'module'),t(")")})

local snippets = {
  statefulWidget,
  statelessWidget,
  formKey,
  abstractClass,
  implementationClass,
  delay,
  modularBind,
  modularRoute,
  modularModuleRoute,
}

return snippets
