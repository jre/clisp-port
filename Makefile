# $OpenBSD: Makefile,v 1.52 2019/07/12 20:47:16 sthen Exp $

ONLY_FOR_ARCHS =	aarch64 amd64 arm i386 powerpc sparc64

COMMENT =		ANSI Common Lisp implementation

DISTNAME=		clisp-2.49.92
CATEGORIES=		lang
HOMEPAGE=		http://clisp.cons.org/

# GPLv2
PERMIT_PACKAGE=	Yes

WANTLIB =  c curses ffcall iconv intl m readline sigsegv unistring

LIB_DEPENDS =		converters/libunistring \
			devel/gettext,-runtime \
			devel/libsigsegv \
			devel/libffcall>=2.2

#MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=clisp/}
MASTER_SITES=		https://haible.de/bruno/gnu/
EXTRACT_SUFX=		.tar.bz2

USE_GMAKE=		Yes

SEPARATE_BUILD=		Yes

CONFIGURE_STYLE=	gnu old
CONFIGURE_ARGS=		--fsstnd=openbsd \
			--disable-mmap \
			--with-gettext \
			--without-gmalloc \
			--mandir=${PREFIX}/man \
			--docdir=${PREFIX}/share/doc/clisp \
			--elispdir=${PREFIX}/share/emacs/site-lisp \
			--vimdir=${PREFIX}/share/doc/clisp \
			--srcdir=${WRKSRC} ${WRKBUILD} \
			--without-dynamic-modules

CONFIGURE_ENV =		ac_cv_prog_DVIPDF='' \
			ac_cv_prog_GROFF='' \
			ac_cv_prog_PS2PDF=''

USE_WXNEEDED =		Yes

pre-build:
	ln -sf ${LOCALBASE}/bin/gmake ${WRKDIR}/bin/make

.include <bsd.port.mk>
