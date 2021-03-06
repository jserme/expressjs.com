
JADE = ./node_modules/.bin/jade

HTML = index.html \
	api.html \
	guide.html \
	applications.html \
	community.html \
	faq.html \
	3x_zh-cn/api.html \
	4x_zh-cn/api.html \
	3x/api.html \
	4x/api.html

docs: $(HTML)

4x/api.html: 4x/api.jade 4x/en/api/*.jade includes/*.jade
	$(JADE) --path $< < $< > $@

%.html: %.jade includes/*.jade zh-cn/*.jade zh-cn/guide/*.jade
	$(JADE) --path $< < $< > $@

clean:
	rm -rf `ls *.html | grep -v jade`

.PHONY: docs clean
