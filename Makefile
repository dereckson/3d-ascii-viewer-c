TARGET_EXEC := viewer
TEMPDIR := tmp

CC      := gcc
LDFLAGS := -lm -lncurses
SRC_DIR := src

SRCS := $(shell find $(SRC_DIR) -name '*.c')
OBJS := $(SRCS:%=$(TEMPDIR)/%.o)

$(TARGET_EXEC): $(OBJS)
	$(CC) $(OBJS) -o $@ $(LDFLAGS)

$(TEMPDIR)/%.c.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -rf $(TARGET_EXEC) $(TEMPDIR)
