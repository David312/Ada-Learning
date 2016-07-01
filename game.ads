with Board;
with Square;
package Game is

   type Game is private;

--     type Coord is private;
--
--     type Game_Status is private;
--
--     type Turn is private;


--   procedure Print(G:in Game);

--     procedure Get_Coord(C:out Coord);

   procedure Reset(G:out Game);

   procedure Start(G:in out Game);


private
   type Coord is
      record
         X:Board.Position;
         Y:Board.Position;
      end record;

   type Game_Status is (NOT_FINISHED,
                        P1_WINS,
                        P2_WINS,
                        DRAW);

   type Turn is (P1,P2);

   type Game is
      record
         Aux_Coord:Coord;
         Player_Turn:Turn := P1;
         Status:Game_Status := NOT_FINISHED;
         Game_Board:Board.Board;
      end record;

end Game;
