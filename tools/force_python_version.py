import os
import sys

def run(filename):
  major = sys.version_info.major
  if major == 2:
    return False
  if os.environ.get('EMSCRIPTEN_ALLOW_NEWER_PYTHON'):
    import logging
    # TODO: colored log
    logging.warning('Running on Python %s which is not officially supported yet' % major)
    return False
  import subprocess
  sys.exit(subprocess.call(['python2', os.path.realpath(filename) + '.py'] + sys.argv[1:]))
  return True
