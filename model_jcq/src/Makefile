TARG:=MTT0920
TARG2:=MTT0920_dev

ifdef ComSpec
    RM=del /F /Q
    COPY=copy
else
    RM=rm -rf
    COPY=cp
endif

all: build/debug/MTT0920  build/release/MTT0920 build/debug/MTT0920_dev build/release/MTT0920_dev

build/debug/$(TARG): build/debug $(TARG).tpl $(TARG2).tpl
	@admb -g $(TARG).tpl $(LIB)
	@$(COPY) $(TARG) build/debug/
	@$(RM) $(TARG)

build/debug/$(TARG2): build/debug $(TARG2).tpl
	@admb -g $(TARG2).tpl $(LIB)
	@$(COPY) $(TARG2) build/debug/
	@$(RM) $(TARG2)

build/release/$(TARG): build/release $(TARG2).tpl
	@admb -f $(TARG).tpl $(LIB)
	@$(COPY) $(TARG) build/release/
	@$(RM) $(TARG)

build/release/$(TARG2): build/release $(TARG).tpl $(TARG2).tpl
	@admb -f $(TARG2).tpl $(LIB)
	@$(COPY) $(TARG2) build/release/
	@$(RM) $(TARG2)

build/debug:
	@echo creating debug directory
	@mkdir -p build/debug

build/release:
	@echo creating release directory
	@mkdir -p build/release

clean:
	#@$(RM) build
	@$(RM) $(TARG).cpp
	@$(RM) $(TARG).htp
	@$(RM) $(TARG).obj

	@$(RM) $(TARG2).cpp
	@$(RM) $(TARG2).htp
	@$(RM) $(TARG2).obj
