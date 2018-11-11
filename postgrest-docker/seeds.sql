
CREATE SCHEMA api;

CREATE TABLE api.todos
(
    id SERIAL PRIMARY KEY,
    done BOOLEAN NOT NULL DEFAULT false,
    task TEXT NOT NULL,
    due TIMESTAMPTZ
);

INSERT INTO api.todos
    (task)
VALUES
    ('finish tutorial 0'),
    ('pat self on back');

CREATE ROLE web_anon NOLOGIN;
GRANT web_anon TO app_user;

GRANT USAGE ON SCHEMA api TO web_anon;
GRANT SELECT ON api.todos TO web_anon;


CREATE ROLE todo_user NOLOGIN;
GRANT todo_user to app_user;

GRANT usage ON schema api TO todo_user;
GRANT all ON api.todos TO todo_user;
GRANT usage, SELECT ON SEQUENCE api.todos_id_seq TO todo_user;