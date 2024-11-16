CFLAGS = -O0 -g
all: msh

msh: msh.c msh.h
	$(CC) $(CFLAGS) -o msh msh.c

clean:
	$(RM) msh
