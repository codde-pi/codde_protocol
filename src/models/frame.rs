use super::widget_registry::WidgetRegistry;
use serde::{Deserialize, Serialize};

#[derive(Deserialize, Serialize)]
struct Frame {
    id: i64,
    data: WidgetRegistry,
}
