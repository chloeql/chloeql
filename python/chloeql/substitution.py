import json
from pathlib import Path


def load_table(table_path):
    """
        Fetch table definition
        TODO: Add constraint checks 
    """
    with open(table_path) as f:
        conf = json.load(f)
    if 'definition' in conf:
        return conf['definition']
    raise ValueError(f'Key "definition" not found in {table_path}')


def load_tables(path):
    """
        Get all the locations of external ChloeDB tables
    """
    macro_list = []
    for database_path in Path(path).iterdir():
        if database_path.is_dir():
            database = database_path.stem
            for table_path in Path(database_path).iterdir():
                if table_path.suffix == '.json':
                    table = table_path.stem
                    macro_list.append(
                        {
                            'database': database,
                            'table': table,
                            'table_full': database + '.' + table,
                            'definition': load_table(table_path)
                        }
                    )
    return macro_list


def parse_query(query, table_list):
    for table_config in table_list:
        query = query.replace(
            table_config['table_full'], '(' + table_config['definition'] + ')')
    return query


if __name__ == '__main__':
    table_list = load_tables(
        '/Users/karlkatzen/Documents/code/chloeql/examples/conf/chloedb_examples')
    query = 'select position from default.users;'
    parsed_query = parse_query(query, table_list)
    print(parsed_query)
