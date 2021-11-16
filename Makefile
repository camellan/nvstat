nv:
	$(CC) nv.c -o nv -lXNVCtrl -lX11 -lXext

clean:
	rm nv
