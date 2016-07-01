package Square is
   type Square is private;
   type Value is (EMPTY,X,O);

   --type Value is private;

   procedure Set_Value(S:in out Square;V:in Value);

   function Get_Value(S:Square) return Value;

   procedure Print(S:in Square);

   procedure Reset(S:out Square);

   function Is_Marked(S:Square)return Boolean;

private

   type Square is
      record
         Data:Value := EMPTY;
         Marked:Boolean := False;
      end record;

end Square;
