EXEC = MTT0920

ifeq ($(SAFE),TRUE)
	DIST = ../../src/build/debug/
else
	DIST = ../../src/build/release/
endif
ARGS = -nox -iprint 50
DATOS = ../../data/

ifdef ComSpec
    RM=del /F /Q
    COPY=copy
else
    RM=rm -rf
    COPY=cp
endif

all: mpd
$(EXEC): $(DIST)$(EXEC).tpl
	ln -sf $(DIST)$(EXEC) $@

$(DIST)$(EXEC).tpl:
	$(MAKE) --directory=../../src

mpd: $(EXEC)
	@$(COPY) $(DATOS)$(EXEC).dat $(EXEC).dat
	@$(COPY) $(DATOS)sard_austral.ctl sard_austral.ctl
	./$(EXEC) $(ARGS)

debug: $(EXEC)
	./$(EXEC) $(ARGS)

plot:
	R CMD BATCH plot.R

clean:
	@$(RM) $(EXEC)
	@$(RM) $(EXEC)  $(EXEC).[pbrces]* $(EXEC).*[0123456789] *.rpt *.log variance gradient.* mcmc.*
	@$(RM) admodel.*
	@$(RM) mcout.rep
	#@$(RM) plot.Rout
	#@$(RM) Rplots.pdf
