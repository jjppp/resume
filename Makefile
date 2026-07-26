ifndef JOBS
  JOBS := $(shell nproc)
endif
MAKEFLAGS += -j$(JOBS)

.PHONY: all clean

all: resume-cn.pdf resume-en.pdf resume-cn-post.pdf resume-en-post.pdf

clean:
	rm resume-cn.pdf resume-en.pdf resume-cn-post.pdf resume-en-post.pdf

resume-cn.pdf: resume-cn.typ chicv.typ
	typst compile resume-cn.typ resume-cn.pdf --input level=submit

resume-en.pdf: resume-en.typ chicv.typ
	typst compile resume-en.typ resume-en.pdf --input level=submit

resume-cn-post.pdf: resume-cn.typ chicv.typ
	typst compile resume-cn.typ resume-cn-post.pdf --input level=post

resume-en-post.pdf: resume-en.typ chicv.typ
	typst compile resume-en.typ resume-en-post.pdf --input level=post
