"""empty message

Revision ID: 2742a682f066
Revises: 29790706ec34
Create Date: 2012-08-26 00:18:06.384837

"""

# revision identifiers, used by Alembic.
revision = '2742a682f066'
down_revision = '34a443e30750'

from alembic import op
import sqlalchemy as sa


def upgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.create_table('travel',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('person_id', sa.Integer(), nullable=True),
    sa.Column('origin_airport', sa.Text(), nullable=False),
    sa.Column('destination_airport', sa.Text(), nullable=False),
    sa.Column('flight_details', sa.Text(), nullable=False),
    sa.ForeignKeyConstraint(['person_id'], ['person.id'], ),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('person_id')
    )
    op.execute("INSERT INTO proposal_status (name) VALUES ('Offered'), ('Contact')")
    ### end Alembic commands ###


def downgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.execute("DELETE FROM proposal_status WHERE name IN ('Offered', 'Contact')")
    op.drop_table('travel')
    ### end Alembic commands ###
