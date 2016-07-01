with Square;


package Board is
   type Board is private;

   function Three_On_Line(B:Board)return Boolean;

   procedure Set_Value(B:in out Board;X:in Position;Y:in Position;V:in Value;Result:out Boolean);

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
