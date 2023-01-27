-- 改行を含む文字列の挿入方法
INSERT INTO hoge_table (column_1) VALUES ('何らかの文字' || chr(10) || 'これで改行できる');
UPDATE hoge_tagle SET column_1 = '何らかの文字' || chr(10) || 'これで改行できる';

COMMENT ON TABLE hoge_table IS '何らかの文字' || chr(10) || 'これで改行できる';
COMMENT ON COLUMN hoge_table.column_1 IS '何らかの文字' || chr(10) || 'これで改行できる';

INSERT INTO hoge_table (column_1) VALUES (E'こうやって\n改行できる。';);
UPDATE hoge_tagle SET column_1 = E'こうやって\n改行できる。';

COMMENT ON TABLE hoge_table IS E'こうやって\n改行できる。';
COMMENT ON COLUMN hoge_table.column_1 IS E'こうやって\n改行できる。';

-- これで1ヶ月後が求められる
SELECT current_timestamp + interval '1 month';

-- 2ヶ月などは複数形で。2ヶ月前
SELECT current_timestamp - interval '2 months';

-- 現在日付からみた今週末の日付
SELECT DATE_TRUNC('week', current_timestamp + '1 week') + '-1 day';
