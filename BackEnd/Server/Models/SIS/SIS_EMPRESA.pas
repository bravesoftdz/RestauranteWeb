unit SIS_EMPRESA;

interface

uses
  Classes,
  DB,
  SysUtils,
  Generics.Collections,
  /// orm
  ormbr.mapping.attributes,
  ormbr.types.mapping,
  ormbr.types.lazy,
  ormbr.types.nullable,
  ormbr.mapping.register;

type
  [Entity]
  [Table('EMPRESA','')]
  [PrimaryKey('EMPRICOD', AutoInc, NoSort, True, 'Chave prim�ria')]
  TSisEmpresa = class
  private
    { Private declarations }
    fid: Integer;
    FNOME: String;
    FFANTASIA: String;
    fCEMP: Integer;
    function GetCEMP: Integer;
  public
    { Public declarations }
    [Restrictions([NoUpdate, NotNull])]
    [Column('EMPRICOD', ftInteger)]
    [Dictionary('EMPRICOD','Mensagem de valida��o','','','',taCenter)]
    property id: Integer read fid write fid;

    [Column('EMPRA60RAZAOSOC', ftString, 60)]
    [Dictionary('EMPRA60RAZAOSOC','Mensagem de valida��o','','','',taLeftJustify)]
    property NOME: String read FNOME write FNOME;

    [Column('EMPRA60NOMEFANT', ftString, 60)]
    [Dictionary('EMPRA60NOMEFANT','Mensagem de valida��o','','','',taLeftJustify)]
    property FANTASIA:String read FFANTASIA write FFANTASIA;

    [Restrictions([NoValidate])]
     property CEMP: Integer read GetCEMP write fCEMP;
  end;

implementation

{ TSisEmpresa }

function TSisEmpresa.GetCEMP: Integer;
begin
  Result := fid;
end;

initialization
  TRegisterClass.RegisterEntity(TSisEmpresa);

end.
