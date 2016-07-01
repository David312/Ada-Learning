GNAT = leon3-elf-gnatmake -a
OBJS = square.o board.o game.o
MAIN = three_on_line
#OPTS = -a

all: $(MAIN).adb
	$(GNAT) $(MAIN)



square.o: square.adb
	 $(GNAT) square.adb

board.o: board.adb
	$(GNAT) board.adb

game.o: game.adb
	$(GNAT) game.adb


clean:
	rm *.o *.ali *~ $(MAIN)
