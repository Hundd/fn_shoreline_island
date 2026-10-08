from pathlib import Path
p=Path('tools/build_popbridge_production.py')
s=p.read_text(encoding='utf-8')
old='mission_board.SetText(text("A skill is a few steps you can use again.\\\\nBuild PopBridge: shoot LOAD. Follow the ramp."))'
s=s.replace(old,'mission_board.SetText(text(card_for("entry")))')
p.write_text(s,encoding='utf-8')
