with System.IO; use System.IO;

package body Board is

   procedure Set_Value(B:in out Board;X:in Position;Y:in Position;V:in Value;Able_To_Mark:out Boolean) is
--      Already_Filled: exception;
   begin
      Able_To_Mark := not Is_Marked(B.Squares(X,Y));
      if Able_To_Mark then
         Set_Value(B.Squares(X,Y),V);
 --     else
--	 raise Already_Filled;
      end if;
   end Set_Value;


   procedure Print(B:in Board) is
   begin
      for I in 1..3 loop
         for J in 1..3 loop
            Print(B.Squares(I,J));
            if J = 3 then
               New_Line;
            end if;
         end loop;
      end loop;
   end Print;


   procedure Reset(B:in out Board) is
   begin
      for I in 1..3 loop
         for J in 1..3 loop
            Reset(B.Squares(I,J));
         end loop;
      end loop;
   end Reset;


   function Three_On_Line(B:Board)return Boolean is

      function Row(B:Board)return Boolean is
         Line_Found:Boolean := False;
      begin
         for I in 1..3 loop
            exit when Line_Found;
            Line_Found := Get_Value(B.Squares(I,1)) /= EMPTY and then
	      (Get_Value(B.Squares(I,1)) = Get_Value(B.Squares(I,2)) and
              Get_Value(B.Squares(I,1)) = Get_Value(B.Squares(I,3)));
         end loop;
         return Line_Found;
      end Row;

      function Column(B:Board)return Boolean is
         Line_Found:Boolean := False;
      begin
         for I in 1..3 loop
            exit when Line_Found;
            Line_Found := Get_Value(B.Squares(1,I)) /= EMPTY and then
	      (Get_Value(B.Squares(1,I)) = Get_Value(B.Squares(2,I)) and
              Get_Value(B.Squares(1,I)) = Get_Value(B.Squares(3,I)));
         end loop;
         return Line_Found;
      end Column;

      function Diagonal(B:Board) return Boolean is
      begin
         return (Get_Value(B.Squares(1,1)) /= EMPTY and then
	   (Get_Value(B.Squares(1,1)) = Get_Value(B.Squares(2,2)) and
           Get_Value(B.Squares(1,1)) = Get_Value(B.Squares(3,3))))
           or
	   (Get_Value(B.Squares(3,1)) /= EMPTY and then
	   (Get_Value(B.Squares(3,1)) = Get_Value(B.Squares(2,2)) and
           Get_Value(B.Squares(3,1)) = Get_Value(B.Squares(1,3))));
      end Diagonal;

   begin
      return Row(B) or  Column(B) or Diagonal(B);
   end Three_On_Line;
   
   
   function Remaining_Turns(B:Board) return Integer is
   begin
      return 9-B.Filled;
   end Remaining_Turns;

end Board;
