--
-- Copyright (c) 2008 Red Hat, Inc.
--
-- This software is licensed to you under the GNU General Public License,
-- version 2 (GPLv2). There is NO WARRANTY for this software, express or
-- implied, including the implied warranties of MERCHANTABILITY or FITNESS
-- FOR A PARTICULAR PURPOSE. You should have received a copy of GPLv2
-- along with this software; if not, see
-- http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
--
-- Red Hat trademarks are not licensed under GPLv2. No permission is
-- granted to use or replicate Red Hat trademarks that are incorporated
-- in this software or its documentation.
--


CREATE TABLE rhnSolarisPatchedPackage
(
    server_id         NUMBER NOT NULL
                          CONSTRAINT rhn_solaris_patchedp_sid_fk
                              REFERENCES rhnServer (id)
                              ON DELETE CASCADE,
    patch_id          NUMBER NOT NULL
                          CONSTRAINT rhn_solaris_patchedp_pid_fk
                              REFERENCES rhnPackage (id)
                              ON DELETE CASCADE,
    package_nevra_id  NUMBER NOT NULL
                          CONSTRAINT rhn_solaris_patchedp_pnid_fk
                              REFERENCES rhnPackageNEVRA (id)
                              ON DELETE CASCADE
)
TABLESPACE [[8m_data_tbs]]
ENABLE ROW MOVEMENT
;

CREATE INDEX rhn_solaris_patchedp_sid_idx
    ON rhnSolarisPatchedPackage (server_id)
    TABLESPACE [[8m_tbs]]
    NOLOGGING;

