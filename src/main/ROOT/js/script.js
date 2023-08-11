const header = document?.querySelector("header");
const mobNavTrigger = document?.querySelector("#nav-trigger");
const mobNav = document?.querySelector("#mobile-nav");
const mobNavBackdrop = mobNav?.querySelector(".backdrop");
const modals = document?.querySelectorAll(".modal");
const successSnackBar = document.querySelector(".snackbar.success");
const infoSnackBar = document.querySelector(".snackar.info");
const warningSnackBar = document.querySelector(".snackbar.warning");
const errorSnackBar = document.querySelector(".snackbar.error");
const snackBars = document.querySelectorAll(".snackbar");
const formElements = document.querySelectorAll(".form-element");
const modalTriggers = document.querySelectorAll("[data-trigger]");

modalTriggers?.forEach(trigger => {
    trigger.addEventListener("click", (e) => {
        const modalId = trigger.getAttribute("data-trigger");
        const modal = document.querySelector(`#${modalId}`);
        modal.classList.add("open");
    });
});


formElements?.forEach((el) => {
    const field = el.querySelector("input") || el.querySelector("textarea");

    if (field != null) {
        if (field.value != "" && field.value != null) {
            el.classList.add("focused");
        }
        field.addEventListener("input", (e) => {
            if (e.target.value !== "") {
                if (!el.classList.contains("focused")) {
                    el.classList.add("focused");
                }
            } else {
                el.classList.remove("focused");
            }
        });
    }
});

snackBars?.forEach((snackbar) => {
    const dismissBtn = snackbar.querySelector(".snackbar-dismiss");
    dismissBtn?.addEventListener("click", () => {
        snackbar.classList.remove("open");
    });
});
const showSnackbar = (
    /**
     * @type {"success" | "error" | "info" | "warning"}
     **/
    type,
    /** @type {String} */
    message,
  /**@type {number} */ timeout = 5000
) => {
    let snackBar;
    switch (type) {
        case "error":
            snackBar = errorSnackBar;
            break;
        case "warning":
            snackBar = warningSnackBar;
            break;
        case "success":
            snackBar = successSnackBar;
            break;
        case "info":
            snackBar = infoSnackBar;
            break;
    }
    if (snackBar != undefined && snackBar != null) {
        const snackBarContent = snackBar.querySelector(".snackbar-content");
        if (snackBarContent) snackBarContent.textContent = message;
        snackBar.classList.add("open");

        setTimeout(() => {
            if (snackBar.classList.contains("open")) {
                snackBar.classList.remove("open");
            }
        }, timeout);
    }
};



mobNavTrigger?.addEventListener("click", () => {
    mobNav.classList.add("open");
});
mobNavBackdrop?.addEventListener("click", (e) => {
    mobNav.classList.remove("open");
});

modals?.forEach((modal) => {
    const modalBackdrop = modal.querySelector(".modal-backdrop");
    modalBackdrop?.addEventListener("click", (e) => {
        modal.classList.remove("open");
    });
});

window.addEventListener("keydown", (e) => {
    if (e.key === "Escape") {
        if (mobNav.classList.contains("open")) {
            mobNav.classList.remove("open");
        }
        const openedModals = document.querySelectorAll(".modal.open");
        const openedSnackBars = document.querySelectorAll(".snackbar.open");

        if (openedSnackBars != null && openedSnackBars.length > 0) {
            openedSnackBars.forEach((x) => x.classList.remove("open"));
        } else {
            openedModals?.forEach((m) => m.classList.remove("open"));
        }
    }
});