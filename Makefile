GNAT = leon3-elf-gnatmake
OBJS = square.o board.o game.o
MAIN = Three_On_Line
OPTS = -a

all: $(OBJS)
	$(GNAT) $(OPTS) $(MAIN)

square.o: square.adb
	 $(GNAT) square.adb

board.o: board.adb
	$(GNAT) board.adb

game.o: game.adb
	$(GNAT) game.adb


clean:
	rm *.o *.ali *~ $(MAIN)
