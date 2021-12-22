unit unit_main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, strutils, Clipbrd;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    input_text: TMemo;
    output_text: TMemo;
    procedure Button3Click(Sender: TObject);
    procedure transform_text();
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.transform_text();
begin
  output_text.Clear;
  output_text.Lines.Text :=
  StringsReplace(input_text.Lines.Text,
                 ['а', 'е', 'о', 'у', 'х', 'я', 'з', 'и', 'п', 'с', 'ь', 'Х', 'С'],
                 ['a', 'e', 'o', 'y', 'x', '9', '3', 'u', 'n', 'c', 'b', 'X', 'C'],
                 [rfReplaceAll]);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Clipboard.AsText := output_text.Text;
  ShowMessage('Текст скопирован в буфер обмена!');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  transform_text();
  ShowMessage('Готово!');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  input_text.Clear;
end;

end.

