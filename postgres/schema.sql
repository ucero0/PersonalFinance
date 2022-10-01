CREATE TABLE `user` (
  `id` bigserial PRIMARY KEY,
  `email` varchar(255) UNIQUE NOT NULL,
  `passwd` varchar(255) UNIQUE NOT NULL,
  `created_at` timestamptz DEFAULT "now()",
  `updated_at` timestamptz DEFAULT "now()"
);

CREATE TABLE `account` (
  `id` bigserial PRIMARY KEY,
  `user_id` integer,
  `categoryAccount` varchar(255),
  `company_name` varchar(255),
  `balance` decimal NOT NULL DEFAULT 0,
  `currency` varchar(255) NOT NULL,
  `created_at` timestamptz DEFAULT "now()",
  `updated_balance_at` timestamptz DEFAULT "now()"
);

CREATE TABLE `income` (
  `id` bigserial PRIMARY KEY,
  `account_id` int,
  `amount` decimal NOT NULL COMMENT 'not negative',
  `description` varchar(255) NOT NULL,
  `created_at` timestamptz DEFAULT "now()"
);

CREATE TABLE `expense` (
  `id` bigserial PRIMARY KEY,
  `account_id` int,
  `amount` decimal NOT NULL COMMENT 'not negative',
  `description` varchar(255) NOT NULL,
  `created_at` timestamptz DEFAULT "now()"
);

CREATE TABLE `company` (
  `id` varchar(255) UNIQUE PRIMARY KEY NOT NULL,
  `created_at` timestamptz DEFAULT "now()",
  `updated_at` timestamptz DEFAULT "now()"
);

CREATE TABLE `categoryAccount` (
  `id` varchar(255) UNIQUE PRIMARY KEY,
  `created_at` timestamptz DEFAULT "now()",
  `updated_at` timestamptz DEFAULT "now()"
);

ALTER TABLE `account` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `account` ADD FOREIGN KEY (`categoryAccount`) REFERENCES `categoryAccount` (`id`);

ALTER TABLE `account` ADD FOREIGN KEY (`company_name`) REFERENCES `company` (`id`);

ALTER TABLE `income` ADD FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

ALTER TABLE `expense` ADD FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);
