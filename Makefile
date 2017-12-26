#
# Makefile for Mailman Wrapper
#

NAME=mailman-wrapper
MAILMAN_PATH=/usr/lib/mailman/mail/mailman

DEST=/usr/local/bin

SUDOERS=$(NAME)-sudoers
SUDOERS_D=/etc/sudoers.d

default: build

%: %.raw
	sed -e 's|__MAILMAN_PATH__|$(MAILMAN_PATH)|g' $< > $@

BUILT=$(NAME) $(SUDOERS)
build: $(BUILT)
TO_CLEAN += $(BUILT)

install: build
	install -m 600 $(SUDOERS) $(SUDOERS_D)
	install -m 755 $(NAME) $(DEST)

uninstall:
	rm -f $(SUDOERS_D)/$(SUDOERS)
	rm -f $(DEST)/$(NAME)

clean:
	rm -rf $(TO_CLEAN)
	find . -name "*~" -print0 | xargs -0 rm -rf
