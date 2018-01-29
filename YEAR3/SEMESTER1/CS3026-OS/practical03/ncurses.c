// ncurses.c

#include <ncurses.h>
#include <unistd.h>

#define DELAY 20000

void printBorders(int max_x, int max_y) {

  int middle_x = max_x / 2;

  // Top & bottom walls
  for (int i = 0; i < max_x; i++) {
    if (i == middle_x - 2) {
      mvprintw(0, i, "Snek!");
      mvprintw(max_y-1, i, "Snek!");
    } else if (!(i > (middle_x - 5) && i < (middle_x + 5))) {
      mvprintw(0, i, "X");
      mvprintw(max_y - 1, i, "X");
    }
  };

  // Side walls
  for (int i = 0; i < max_y; i++) {
    mvprintw(i, 0, "X");
    mvprintw(i, max_x - 1, "X");
  };

}

int main(int argc, char *argv[]) {

  int x = 0, y = 10;
  int max_y = 0, max_x = 0;
  int next_x = 0, next_y = 0;
  int xdirection = 1;
  int ydirection = 1;

  initscr();
  noecho();
  curs_set(FALSE);

  start_color();			/* Start color 			*/
	init_pair(1, COLOR_RED, COLOR_BLACK);

	attron(COLOR_PAIR(1));

  while(1) {
    getmaxyx(stdscr, max_y, max_x);

    clear();

    printBorders(max_x, max_y);

    mvprintw(y,x,"o");
    mvprintw(y + 10,x,"o");
    mvprintw(y - 10,x,"o");
    mvprintw(y,x + 10,"o");
    mvprintw(y,x - 10,"o");


    mvprintw(max_y - y,max_x - x,"o");
    mvprintw(max_y - y + 10,max_x - x,"o");
    mvprintw(max_y - y - 10,max_x - x,"o");
    mvprintw(max_y - y,max_x - x + 10,"o");
    mvprintw(max_y - y,max_x - x - 10,"o");

    mvprintw(max_y - y,x,"o");
    mvprintw(max_y - y + 10,x,"o");
    mvprintw(max_y - y - 10,x,"o");


    mvprintw(max_y - y,x + 10,"o");
    mvprintw(max_y - y,x - 10,"o");


    mvprintw(y,max_x - x,"o");

    refresh();

    usleep(DELAY);

    next_x = x + xdirection;
    next_y = y + ydirection;

    if(next_x >= max_x - 1 || next_x < 1) {
      xdirection*= -1;
    } else {
      x+= xdirection;
    }

    if(next_y >= max_y - 1 || next_y < 1) {
      ydirection*= -1;
    } else {
      y+= ydirection;
    }
  }
  endwin();
}
