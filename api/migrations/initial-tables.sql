DROP TABLE IF EXISTS "Users" CASCADE;
CREATE TABLE IF NOT EXISTS "Users" ("id" VARCHAR(60), "name" VARCHAR(255) NOT NULL, "password" VARCHAR(255) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "updatedAt" TIMESTAMP WITH TIME ZONE NOT NULL, PRIMARY KEY ("id"));
SELECT i.relname AS name, ix.indisprimary AS primary, ix.indisunique AS unique, ix.indkey AS indkey, array_agg(a.attnum) as column_indexes, array_agg(a.attname) AS column_names, pg_get_indexdef(ix.indexrelid) AS definition FROM pg_class t, pg_class i, pg_index ix, pg_attribute a WHERE t.oid = ix.indrelid AND i.oid = ix.indexrelid AND a.attrelid = t.oid AND t.relkind = 'r' and t.relname = 'Users' GROUP BY i.relname, ix.indexrelid, ix.indisprimary, ix.indisunique, ix.indkey ORDER BY i.relname;
DROP TABLE IF EXISTS "Wallets" CASCADE;
CREATE TABLE IF NOT EXISTS "Wallets" ("id" VARCHAR(60), "name" VARCHAR(255) NOT NULL, "address" VARCHAR(255) NOT NULL, "local" BOOLEAN NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "updatedAt" TIMESTAMP WITH TIME ZONE NOT NULL, "UserId" VARCHAR(60) REFERENCES "Users" ("id") ON DELETE SET NULL ON UPDATE CASCADE, PRIMARY KEY ("id"));
SELECT i.relname AS name, ix.indisprimary AS primary, ix.indisunique AS unique, ix.indkey AS indkey, array_agg(a.attnum) as column_indexes, array_agg(a.attname) AS column_names, pg_get_indexdef(ix.indexrelid) AS definition FROM pg_class t, pg_class i, pg_index ix, pg_attribute a WHERE t.oid = ix.indrelid AND i.oid = ix.indexrelid AND a.attrelid = t.oid AND t.relkind = 'r' and t.relname = 'Wallets' GROUP BY i.relname, ix.indexrelid, ix.indisprimary, ix.indisunique, ix.indkey ORDER BY i.relname;
DROP TABLE IF EXISTS "Coins" CASCADE;
CREATE TABLE IF NOT EXISTS "Coins" ("id" VARCHAR(60), "feeTolerance" VARCHAR(255) DEFAULT '0', "name" VARCHAR(255) NOT NULL, "code" VARCHAR(255) NOT NULL, "active" BOOLEAN DEFAULT false, "portfolioWeight" INTEGER DEFAULT 0, "localAmount" VARCHAR(255) DEFAULT '0', "exchangeAmount" VARCHAR(255) DEFAULT '0', "purchaseAmount" VARCHAR(255) DEFAULT '0', "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "updatedAt" TIMESTAMP WITH TIME ZONE NOT NULL, "UserId" VARCHAR(60) REFERENCES "Users" ("id") ON DELETE SET NULL ON UPDATE CASCADE, "localWalletId" VARCHAR(60) REFERENCES "Wallets" ("id") ON DELETE SET NULL ON UPDATE CASCADE, "exchangeWalletId" VARCHAR(60) REFERENCES "Wallets" ("id") ON DELETE SET NULL ON UPDATE CASCADE, PRIMARY KEY ("id"));
SELECT i.relname AS name, ix.indisprimary AS primary, ix.indisunique AS unique, ix.indkey AS indkey, array_agg(a.attnum) as column_indexes, array_agg(a.attname) AS column_names, pg_get_indexdef(ix.indexrelid) AS definition FROM pg_class t, pg_class i, pg_index ix, pg_attribute a WHERE t.oid = ix.indrelid AND i.oid = ix.indexrelid AND a.attrelid = t.oid AND t.relkind = 'r' and t.relname = 'Coins' GROUP BY i.relname, ix.indexrelid, ix.indisprimary, ix.indisunique, ix.indkey ORDER BY i.relname;
DROP TABLE IF EXISTS "Sessions" CASCADE;
CREATE TABLE IF NOT EXISTS "Sessions" ("sid" VARCHAR(32) , "expires" TIMESTAMP WITH TIME ZONE, "data" TEXT, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "updatedAt" TIMESTAMP WITH TIME ZONE NOT NULL, PRIMARY KEY ("sid"));
SELECT i.relname AS name, ix.indisprimary AS primary, ix.indisunique AS unique, ix.indkey AS indkey, array_agg(a.attnum) as column_indexes, array_agg(a.attname) AS column_names, pg_get_indexdef(ix.indexrelid) AS definition FROM pg_class t, pg_class i, pg_index ix, pg_attribute a WHERE t.oid = ix.indrelid AND i.oid = ix.indexrelid AND a.attrelid = t.oid AND t.relkind = 'r' and t.relname = 'Sessions' GROUP BY i.relname, ix.indexrelid, ix.indisprimary, ix.indisunique, ix.indkey ORDER BY i.relname;
DROP TABLE IF EXISTS "Transactions" CASCADE;
CREATE TABLE IF NOT EXISTS "Transactions" ("id" VARCHAR(60), "startAmount" VARCHAR(255) DEFAULT '0', "endAmount" VARCHAR(255) DEFAULT '0', "success" BOOLEAN DEFAULT false, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "updatedAt" TIMESTAMP WITH TIME ZONE NOT NULL, "UserId" VARCHAR(60) REFERENCES "Users" ("id") ON DELETE SET NULL ON UPDATE CASCADE, "startWalletId" VARCHAR(60) REFERENCES "Wallets" ("id") ON DELETE SET NULL ON UPDATE CASCADE, "endWalletId" VARCHAR(60) REFERENCES "Wallets" ("id") ON DELETE SET NULL ON UPDATE CASCADE, "startCoinId" VARCHAR(60) REFERENCES "Coins" ("id") ON DELETE SET NULL ON UPDATE CASCADE, "endCoinId" VARCHAR(60) REFERENCES "Coins" ("id") ON DELETE SET NULL ON UPDATE CASCADE, PRIMARY KEY ("id"));
SELECT i.relname AS name, ix.indisprimary AS primary, ix.indisunique AS unique, ix.indkey AS indkey, array_agg(a.attnum) as column_indexes, array_agg(a.attname) AS column_names, pg_get_indexdef(ix.indexrelid) AS definition FROM pg_class t, pg_class i, pg_index ix, pg_attribute a WHERE t.oid = ix.indrelid AND i.oid = ix.indexrelid AND a.attrelid = t.oid AND t.relkind = 'r' and t.relname = 'Transactions' GROUP BY i.relname, ix.indexrelid, ix.indisprimary, ix.indisunique, ix.indkey ORDER BY i.relname;
DROP TABLE IF EXISTS "Options" CASCADE;
CREATE TABLE IF NOT EXISTS "Options" ("id" VARCHAR(60), "name" VARCHAR(255) NOT NULL, "value" VARCHAR(255) NOT NULL, "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "updatedAt" TIMESTAMP WITH TIME ZONE NOT NULL, "UserId" VARCHAR(60) REFERENCES "Users" ("id") ON DELETE SET NULL ON UPDATE CASCADE, PRIMARY KEY ("id"));
SELECT i.relname AS name, ix.indisprimary AS primary, ix.indisunique AS unique, ix.indkey AS indkey, array_agg(a.attnum) as column_indexes, array_agg(a.attname) AS column_names, pg_get_indexdef(ix.indexrelid) AS definition FROM pg_class t, pg_class i, pg_index ix, pg_attribute a WHERE t.oid = ix.indrelid AND i.oid = ix.indexrelid AND a.attrelid = t.oid AND t.relkind = 'r' and t.relname = 'Options' GROUP BY i.relname, ix.indexrelid, ix.indisprimary, ix.indisunique, ix.indkey ORDER BY i.relname;