BACKUPDATE := $(shell date '+%Y%m%d%H%M%S')
CONFIGDIRS := $(subst /,,$(shell ls -Ad */))
OUTFILTER := .DS_Store
DOTFILESFULL := $(addprefix $(PWD)/,$(foreach dir,$(CONFIGDIRS),$(shell find $(dir) -type f | grep -v $(OUTFILTER) )))
DOTDIR := $(addprefix $(HOME)/,$(filter-out ./,$(sort $(dir $(foreach dir,$(CONFIGDIRS),$(shell find $(dir) -type f | cut -d/ -f 2-))))))
DOTFILES = $(addprefix $(HOME)/,$(foreach path,$(subst $(PWD)/,,$(DOTFILESFULL)),$(patsubst $(firstword $(subst /, ,$(path)))/%,%,$(path))))

link: | $(DOTDIR) $(DOTFILES)

$(DOTDIR):
	@mkdir -p -m700 $@

$(DOTFILES):
	@ln -sv $(filter $(PWD)/%/$(subst $(HOME)/,,$@), $(DOTFILESFULL)) $@

backup:
	@mkdir -p -m700 $(HOME)/.backup
	@for file in $(DOTFILES); do \
		[ -f $$file ] && tar -rvPf $(HOME)/.backup/dotfiles_$(BACKUPDATE).tar $$file || true ; \
	done

$(HOME)/.backup/dotfiles.tar:
	@mkdir -p -m700 $(HOME)/.backup
	@for file in $(DOTFILES); do \
		[ -f $$file ] && tar -rvPf $@ $$file || true ; \
	done

clean: backup
	@for file in $(DOTFILES); do \
		[ -f $$file ] && rm $$file || true ; \
	done
