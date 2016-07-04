with Square; use Square;



package Board is
   type Board is private;
   subtype Position is Integer range 1..3;

   function Three_On_Line(B:Board)return Boolean;

   function Remaining_Turns(B:Board)return Integer;

   procedure Set_Value(B:in out Board;X:in Position;Y:in Position;V:in Value;Able_To_Mark:out Boolean);

   procedure Print(B:in Board);

   procedure Reset(B:in out Board);

private
   type Square_Matrix is array(1..3,1..3) of Square.Square;
   type Board is
      record
         Squares:Square_Matrix;
         Filled:Integer;
      end record;

end Board;
