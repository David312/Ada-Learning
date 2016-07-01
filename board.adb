with System.IO; use System.IO;

package body Board is

   procedure Set_Value(B:in out Board;X:in Position;Y:in Position;V:in Value;Result:out Boolean) is
   begin
      if B.Squares(X,Y).Is_Marked  then
         B.Squares(X,Y).Set_Value(V);

         Result := True;
      else

         Result := False;
      end if;
   end Set_Value;


   procedure Print(B:in Board) is
      I,J:Integer;
   begin
      for I in 1..3 loop
         for J in 1..3 loop
            B.Squares(I,J).Print;
            if J = 3 then
               New_Line;
            end if;
         end loop;
      end loop;
   end Print;


   procedure Reset(B:in out Board) is
      I,J:Integer;
   begin
      for I in 1..3 loop
         for J in 1..3 loop
            B.Squares(I,J).Reset;
         end loop;
      end loop;
   end Reset;


   function Three_On_Line(B:Board)return Boolean is

      function Row(B:Board)return Boolean is
         I:Integer;
         Res:Boolean := False;
      begin
         for I in 1..3 loop
            exit when Res = True;
            Res := B.Squares(I,1).Get_Value = B.Squares(I,2).Get_Value and
              B.Squares(I,1).Get_Value = B.Squares(I,3).Get_Value;
         end loop;
         return Res;
      end Row;

      function Column(B:Board)return Boolean is
         I:Integer;
         Res:Boolean := False;
      begin
         for I in 1..3 loop
            exit when Res = True;
            Res := B.Squares(1,I).Get_Value = B.Squares(2,I).Get_Value and
              B.Squares(1,I).Get_Value = B.Squares(3,I).Get_Value;
         end loop;
         return Res;
      end Column;

      function Diagonal(B:Board) return Boolean is
      begin
         return (B.Squares(1,1).Get_Value = B.Squares(2,2).Get_Value and
           B.Squares(1,1).Get_Value = B.Squares(3,3).Get_Value)
           or
             (B.Squares(3,1).Get_Value = B.Squares(2,2).Get_Value and
           B.Squares(3,1).Get_Value = B.Squares(1,3).Get_Value);
      end Diagonal;

   begin


      return (Row(B) or Column(B) or Diagonal(B));

   end Three_On_Line;


end Board;
