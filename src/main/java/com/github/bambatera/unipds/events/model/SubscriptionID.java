package com.github.bambatera.unipds.events.model;

import jakarta.persistence.Embeddable;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Embeddable
public class SubscriptionID {

    @ManyToOne
    @JoinColumn(name = "subscribed_user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "session_id")
    private Session session;

    public SubscriptionID() {
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Session getSession() {
        return session;
    }

    public void setSession(Session session) {
        this.session = session;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SubscriptionID that = (SubscriptionID) o;

        if (!user.equals(that.user)) return false;
        return session.equals(that.session);
    }

    @Override
    public int hashCode() {
        int result = user.hashCode();
        result = 31 * result + session.hashCode();
        return result;
    }
}
