<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220529174624 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE modification (id INT AUTO_INCREMENT NOT NULL, author_id INT NOT NULL, post_id INT NOT NULL, text_modification VARCHAR(5000) NOT NULL, INDEX IDX_EF6425D2F675F31B (author_id), INDEX IDX_EF6425D24B89032C (post_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE modification ADD CONSTRAINT FK_EF6425D2F675F31B FOREIGN KEY (author_id) REFERENCES user (id)');
        $this->addSql('ALTER TABLE modification ADD CONSTRAINT FK_EF6425D24B89032C FOREIGN KEY (post_id) REFERENCES publication (id)');
        $this->addSql('ALTER TABLE publication DROP FOREIGN KEY FK_AF3C6779A545015');
        $this->addSql('ALTER TABLE publication DROP FOREIGN KEY FK_AF3C677976404F3C');
        $this->addSql('DROP INDEX idx_af3c6779a545015 ON publication');
        $this->addSql('CREATE INDEX IDX_AF3C677912469DE2 ON publication (category_id)');
        $this->addSql('DROP INDEX idx_af3c677976404f3c ON publication');
        $this->addSql('CREATE INDEX IDX_AF3C6779F675F31B ON publication (author_id)');
        $this->addSql('ALTER TABLE publication ADD CONSTRAINT FK_AF3C6779A545015 FOREIGN KEY (category_id) REFERENCES category (id)');
        $this->addSql('ALTER TABLE publication ADD CONSTRAINT FK_AF3C677976404F3C FOREIGN KEY (author_id) REFERENCES user (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE modification');
        $this->addSql('ALTER TABLE publication DROP FOREIGN KEY FK_AF3C677912469DE2');
        $this->addSql('ALTER TABLE publication DROP FOREIGN KEY FK_AF3C6779F675F31B');
        $this->addSql('DROP INDEX idx_af3c677912469de2 ON publication');
        $this->addSql('CREATE INDEX IDX_AF3C6779A545015 ON publication (category_id)');
        $this->addSql('DROP INDEX idx_af3c6779f675f31b ON publication');
        $this->addSql('CREATE INDEX IDX_AF3C677976404F3C ON publication (author_id)');
        $this->addSql('ALTER TABLE publication ADD CONSTRAINT FK_AF3C677912469DE2 FOREIGN KEY (category_id) REFERENCES category (id)');
        $this->addSql('ALTER TABLE publication ADD CONSTRAINT FK_AF3C6779F675F31B FOREIGN KEY (author_id) REFERENCES user (id)');
    }
}
