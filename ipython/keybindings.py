from IPython import get_ipython
from prompt_toolkit.enums import DEFAULT_BUFFER
from prompt_toolkit.filters import HasFocus, ViInsertMode
from prompt_toolkit.key_binding.vi_state import InputMode

ip = get_ipython()

if getattr(ip, 'pt_app'):
    kbs = ip.pt_app.key_bindings
    @kbs.add(u'j', u'j', filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode()))
    def _(event):
        vi_state = event.cli.vi_state
        vi_state.input_mode = InputMode.NAVIGATION

