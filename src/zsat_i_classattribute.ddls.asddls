@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Attribute of Class/Interface'

define view entity ZSAT_I_ClassAttribute
  as select from seocompo   as Comp
    inner join   seocompodf as Def on  Comp.clsname = Def.clsname
                                   and Comp.cmpname = Def.cmpname
{
  key Comp.clsname                           as ClassName,
  key Comp.cmpname                           as AttributeName,
      // 0 - Instance
      // 1 - Static
      // 2 - Constant
      Def.attdecltyp                         as DeclarationType,
      upper(replace(Def.attvalue, '''', '')) as Value
}
where
  Comp.cmptype = '0'
