# evo_report.py
import argparse
import pandas as pd
import json
import matplotlib.pyplot as plt
import os

def funnel_conversion(events):
    steps = ["Loaded", "Interact", "Clicks", "Purchase"]

    # Count distinct users per step + device
    step_users = (
        events[events["event_name"].isin(steps)]
        .groupby(["device", "event_name"])["user_id"]
        .nunique()
        .reset_index(name="users")
    )

    # Map step order
    order_map = {s: i + 1 for i, s in enumerate(steps)}
    step_users["step_order"] = step_users["event_name"].map(order_map)

    results = []
    for device, grp in step_users.groupby("device"):
        grp = grp.sort_values("step_order")
        start_users = grp["users"].max()  # loaded
        prev_users = None
        for _, row in grp.iterrows():
            conv_from_start = round(100 * row["users"] / start_users, 2)
            conv_from_prev = round(100 * row["users"] / prev_users, 2) if prev_users else 100.0
            results.append({
                "step": row["event_name"],
                "users": int(row["users"]),
                "conv_from_prev_pct": conv_from_prev,
                "conv_from_start_pct": conv_from_start,
                "device": device
            })
            prev_users = row["users"]

    return results


def intent_distribution(messages, events):
    # Replace null/empty with 'unknown'
    messages["intent"] = messages["detected_intent"].fillna("").str.strip().replace("", "unknown")

    intent_counts = messages.groupby("intent").size().reset_index(name="count")
    total = intent_counts["count"].sum()
    intent_counts["pct_of_total"] = round(100 * intent_counts["count"] / total, 2)

    intents = intent_counts.sort_values("count", ascending=False).to_dict(orient="records")
    return intents


def cancellation_sla(orders):
    orders["created_at"] = pd.to_datetime(orders["created_at"])
    orders["canceled_at"] = pd.to_datetime(orders["canceled_at"], errors="coerce")

    orders["canceled"] = orders["canceled_at"].notna().astype(int)
    orders["violation"] = (
        (orders["canceled_at"] - orders["created_at"]).dt.total_seconds() > 3600
    ).astype(int)

    total_orders = len(orders)
    canceled = orders["canceled"].sum()
    violations = orders["violation"].sum()
    violation_rate = round(100 * violations / canceled, 2) if canceled > 0 else 0

    return {
        "total_orders": int(total_orders),
        "canceled": int(canceled),
        "violations": int(violations),
        "violation_rate_pct": violation_rate
    }


def plot_funnel(funnel, out_dir):
    df = pd.DataFrame(funnel)
    plt.figure(figsize=(8, 6))
    for device, grp in df.groupby("device"):
        plt.plot(grp["step"], grp["conv_from_start_pct"], marker="o", label=device)
    plt.title("Funnel Conversion by Step (per Device)")
    plt.ylabel("Conversion from Start (%)")
    plt.xlabel("Step")
    plt.legend()
    plt.tight_layout()
    plt.savefig(os.path.join(out_dir, "funnel.png"))
    plt.close()


def plot_intents(intents, out_dir):
    df = pd.DataFrame(intents).head(10)
    plt.figure(figsize=(8, 6))
    plt.bar(df["intent"], df["pct_of_total"])
    plt.xticks(rotation=45, ha="right")
    plt.title("Top 10 Intents Share")
    plt.ylabel("Percentage of Total (%)")
    plt.tight_layout()
    plt.savefig(os.path.join(out_dir, "intents.png"))
    plt.close()


def main():
    parser = argparse.ArgumentParser(description="Generate report from events, messages, and orders data.")
    parser.add_argument("--events", required=True)
    parser.add_argument("--messages", required=True)
    parser.add_argument("--orders", required=True)
    parser.add_argument("--out", required=True)
    args = parser.parse_args()

    os.makedirs(args.out, exist_ok=True)

    # Load CSVs
    events = pd.read_csv(args.events)
    messages = pd.read_csv(args.messages)
    orders = pd.read_csv(args.orders)

    # Process parts
    funnel = funnel_conversion(events)
    intents = intent_distribution(messages, events)
    sla = cancellation_sla(orders)

    # Save JSON
    report = {
        "funnel": funnel,
        "intents": intents,
        "cancellation_sla": sla
    }
    with open(os.path.join(args.out, "report.json"), "w") as f:
        json.dump(report, f, indent=2)

    # Save plots
    plot_funnel(funnel, args.out)
    plot_intents(intents, args.out)


if __name__ == "__main__":
    main()
