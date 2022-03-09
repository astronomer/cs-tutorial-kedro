from kedro.framework.session import KedroSession
from kedro.framework.project import configure_project
import sys
package_name=sys.argv[1]
pipeline_name=sys.argv[2]
node_name=sys.argv[3]
project_path=sys.argv[4]
env=sys.argv[5]
configure_project(package_name)
with KedroSession.create(package_name,
                         project_path,
                         env=env) as session:
    session.run(pipeline_name, node_names=[node_name])
