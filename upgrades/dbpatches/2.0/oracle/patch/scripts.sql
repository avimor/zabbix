ALTER TABLE scripts MODIFY scriptid DEFAULT NULL;
ALTER TABLE scripts MODIFY usrgrpid DEFAULT NULL;
ALTER TABLE scripts MODIFY usrgrpid NULL;
ALTER TABLE scripts MODIFY groupid DEFAULT NULL;
ALTER TABLE scripts MODIFY groupid NULL;
UPDATE scripts SET usrgrpid=NULL WHERE usrgrpid=0;
UPDATE scripts SET groupid=NULL WHERE groupid=0;
DELETE FROM scripts WHERE NOT usrgrpid IS NULL AND NOT usrgrpid IN (SELECT usrgrpid FROM usrgrp);
DELETE FROM scripts WHERE NOT groupid IS NULL AND NOT groupid IN (SELECT groupid FROM groups);
ALTER TABLE scripts ADD CONSTRAINT c_scripts_1 FOREIGN KEY (usrgrpid) REFERENCES usrgrp (usrgrpid);
ALTER TABLE scripts ADD CONSTRAINT c_scripts_2 FOREIGN KEY (groupid) REFERENCES groups (groupid);