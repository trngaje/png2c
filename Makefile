

TARGET = png2c

CC 	= $(CROSS_COMPILE)gcc

SOURCES = . 
CFILES = $(foreach dir, $(SOURCES), $(wildcard $(dir)/*.c))
OFILES = $(CFILES:.c=.o)

CFLAGS = $(shell sdl-config --cflags)

ifeq ($(shell uname), Linux)
LDFLAGS = $(shell sdl-config --libs) -lm  -lSDL_image
else
CFLAGS += -DWIN32
LDFLAGS =  -LC:/msys64/mingw64/lib -lmingw32 -lSDLmain -lSDL -lm  -lSDL_image
endif


$(TARGET): $(OFILES)
	$(CC) $(OFILES) -o $@ $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) $(OFILES)
