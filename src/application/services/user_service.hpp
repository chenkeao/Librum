#pragma once
#include <QObject>
#include "i_user_service.hpp"
#include "i_user_storage_gateway.hpp"
#include "user.hpp"

namespace application::services
{

class UserService : public IUserService
{
    Q_OBJECT

public:
    UserService(IUserStorageGateway* userStorageGateway);

    void loadUser() override;

    QString getFirstName() const override;
    void setFirstName(const QString& newFirstName) override;

    QString getLastName() const override;
    void setLastName(const QString& newLastName) override;

    QString getEmail() const override;
    void setEmail(const QString& newEmail) override;

    QImage getProfilePicture() const override;
    void setProfilePicture(const QImage& image) override;

    const std::vector<domain::models::Tag>& getTags() const override;
    bool addTag(const domain::models::Tag& tag) override;
    bool removeTag(const QString& tagName) override;
    bool renameTag(const QString& oldName, const QString& newName) override;


public slots:
    void setAuthenticationToken(const QString& token,
                                const QString& email) override;
    void clearAuthenticationToken() override;


private slots:
    void proccessUserInformation(const domain::models::User& user,
                                 bool success);

private:
    IUserStorageGateway* m_userStorageGateway;
    domain::models::User m_user;
    QString m_authenticationToken;
};

}  // namespace application::services