with System.IO;use System.IO;
with Ada.Integer_Text_IO;


package body Game is

   procedure Print_Turn (T:Turn) is
      C:Character;
   begin
      case T is
         when P1 => C := '1';
         when P2 => C:= '2';
      end case;
      Put(C);
   end Print_Turn;

   procedure Get_Coord(G:Game;X:out Board.Position;Y:out Board.Position) is
      --        X,Y:Integer;
   begin
      Put("Please enter X coordinate");
      Ada.Integer_Text_IO.Get(X);
      Put("Please enter Y coordinate");
      Ada.Integer_Text_IO.Get(Y);
      --        X := X;
      --        Y := Y;
   end Get_Coord;


   procedure Print(G:in Game) is
   begin
      Board.Print(G.Game_Board); -- Print the board
      Put("Player "); Print_Turn(G.Player_Turn); Put_Line(" your turn:");-- Print player's turn
   end Print;

   procedure Update_Value(T:Turn;V:out Square.Value) is
   begin
      case T is
         when P1 => V := Square.X;
         when P2 => V := Square.O;
      end case;
   end Update_Value;


   procedure Announce_Winner(G:Game) is
   begin
      if G.Status /= DRAW then
         Put("Congratulations Player "); Print_Turn(G.Player_Turn);
         Put_Line("! You are the winner!!!");
      else
         Put_Line("Nobody wins this time...");
      end if;
   end Announce_Winner;


   procedure Start(G:in out Game) is
      Res:Boolean;
      Val:Square.Value;
      X,Y:Board.Position;
   begin
      G.Player_Turn := P1;
      G.Status := NOT_FINISHED;
      loop
         exit when G.Status /= NOT_FINISHED;
         Update_Value(G.Player_Turn,Val);
         Res := False;

         -- Print the game board and turn
         Print(G);

         -- Get a correct Position value
         while Res = False loop
            Get_Coord(G,X,Y);
            Board.Set_Value(G.Game_Board,G.Aux_Coord.X,G.Aux_Coord.Y,Val,Res);
         end loop;

         -- Check if there is a winner
         if Board.Three_On_Line(G.Game_Board) then
            -- Update Game status
            if G.Player_Turn = P1 then
               G.Status := P1_WINS;
            else
               G.Status := P2_WINS;
            end if;
            -- Check if the game is over
         elsif Board.Remaining_Turns(G.Game_Board) = 0 then
            G.Status := DRAW;
         end if;

         -- If the game is over a message is printed
         if G.Status /= NOT_FINISHED then
            Announce_Winner(G);
            -- Else the game is moved to the next step
         else
            if G.Player_Turn = P1 then
               G.Player_Turn := P2;
            else
               G.Player_Turn := P1;
            end if;
         end if;
      end loop;

   end Start;


   procedure Reset(G:out Game) is
   begin
      G.Player_Turn := P1;
      G.Status := NOT_FINISHED;
      Board.Reset(G.Game_Board);
   end Reset;

end Game;
