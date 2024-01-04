use serde::{Deserialize, Serialize};

#[derive(Deserialize, Serialize)]
struct ClickButton {}

type WidgetData = (ClickButton);
