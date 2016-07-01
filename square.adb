with System.IO; use System.IO;


package body Square is

   procedure Set_Value(S:in out Square;V:in Value) is
   begin
      S.Data := V;
      S.Marked := True;
   end Set_Value;


   function Get_Value(S:Square) return Value is
   begin
      return S.Data;
   end Get_Value;


   procedure Print(S:Square) is
      C:Character;
   begin
      case S.Data is
         when EMPTY => C := ' ';
         when X => C := 'X';
         when O => C := 'O';
         when others => C := 'E'; -- Should not be used
      end case;
      Put("["& C &"]");
   end Print;


   procedure Reset(S:out Square) is
   begin
      S.Data := EMPTY;
      S.Marked := False;
   end Reset;


   function Is_Marked(S:Square)return Boolean is
   begin
      return S.Marked;
   end Is_Marked;




end Square;
