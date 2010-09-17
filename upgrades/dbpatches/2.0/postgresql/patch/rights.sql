ALTER TABLE ONLY rights ALTER rightid DROP DEFAULT,
			ALTER groupid DROP DEFAULT,
			ALTER id SET NOT NULL;
DELETE FROM rights WHERE NOT groupid IN (SELECT usrgrpid FROM usrgrp);
DELETE FROM rights WHERE NOT id IN (SELECT groupid FROM groups);
ALTER TABLE ONLY rights ADD CONSTRAINT c_rights_1 FOREIGN KEY (groupid) REFERENCES usrgrp (usrgrpid) ON DELETE CASCADE;
ALTER TABLE ONLY rights ADD CONSTRAINT c_rights_2 FOREIGN KEY (id) REFERENCES groups (groupid) ON DELETE CASCADE;