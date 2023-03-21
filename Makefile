TARGET=bin/tcp_server bin/tcp_client
CFLAGS=-I./include -Wall
LDFLAGS=
PREPARE=obj bin

all: $(PREPARE) $(TARGET)

clean:
	rm -rf bin obj

$(PREPARE):
	mkdir $@

bin/tcp_server: obj/server.o
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

obj/server.o: src/tcp_server.c include/tcp_server.h
	$(CC) -c $(CFLAGS) $< -o $@

bin/tcp_client: obj/client.o
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

obj/client.o: src/tcp_client.c include/tcp_client.h
	$(CC) -c $(CFLAGS) $< -o $@
